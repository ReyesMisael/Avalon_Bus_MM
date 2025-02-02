library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Declaración del testbench para el avalon_master_writer_2
entity tb_avalon_master_writer_2 is
end tb_avalon_master_writer_2;

architecture behavior of tb_avalon_master_writer_2 is

    -- Señales de prueba (para conectar al UUT)
    signal clk               : STD_LOGIC := '0';  								-- Señal de reloj
    signal reset_n           : STD_LOGIC := '1';  								-- Reset activo bajo
    signal write             : STD_LOGIC;          							-- Señal de escritura
    signal chipselect        : STD_LOGIC;          							-- Señal de chipselect
    signal address           : STD_LOGIC_VECTOR(31 downto 0);  			-- Dirección
    signal byteenable        : STD_LOGIC_VECTOR(3 downto 0);   			-- Habilitación de bytes
    signal writedata         : STD_LOGIC_VECTOR(31 downto 0);  			-- Datos de escritura
    signal writeresponsevalid : STD_LOGIC := '0'; 								-- Respuesta de la escritura
    signal response          : STD_LOGIC_VECTOR(1 downto 0) := "00";  	-- Respuesta de escritura
    signal waitrequest       : STD_LOGIC := '0';  								-- Señal de espera

    -- Señales de la FIFO
    signal user_data         : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal user_wrreq        : STD_LOGIC := '0';
    signal user_wrclk        : STD_LOGIC := '0';
    signal user_rdempty      : STD_LOGIC;
    signal user_fifo_full    : STD_LOGIC;

    -- Señales internas del UUT
    signal rdclk_sig         : STD_LOGIC;
    signal rdreq_sig         : STD_LOGIC;
    signal q_sig             : STD_LOGIC_VECTOR(31 downto 0);
    signal rdempty_sig       : STD_LOGIC;
    signal wrfull_sig        : STD_LOGIC;

begin

    -- Instanciamos el UUT (Unidad bajo prueba)
    avalon : entity work.avalon_master_writer_2(Behavioral)
        port map (
            clk                => clk,
            reset_n            => reset_n,
            write              => write,
            chipselect         => chipselect,
            address            => address,
            byteenable         => byteenable,
            writedata          => writedata,
            writeresponsevalid => writeresponsevalid,
            response           => response,
            waitrequest        => waitrequest,
            user_data          => user_data,
            user_wrreq         => user_wrreq,
            user_wrclk         => user_wrclk,
            user_rdempty       => user_rdempty,
            user_fifo_full     => user_fifo_full			
        );

    -- Generador de reloj
    clock_gen: process
    begin
        clk 		<= '0';
        wait for 10 ns;
        clk 		<= '1';
        wait for 10 ns;
    end process;
	
	user_wrclk <= clk;
    -- Generador de señales de prueba
    stimulus: process
    begin
        -- Inicialización
        reset_n 	<= '1';   	-- Activamos reset
        wait for 20 ns;   		-- Esperamos a que el reset se propague
        reset_n 	<= '0';   	-- Desactivamos reset
			
		  writeresponsevalid <= '1';
        response         	<=	"00"; 
        waitrequest 			<= '0';
		  user_wrreq	<=	'1';
        -- Esperamos antes de escribir en la memoria
        wait for 20 ns;

        -- Escritura en direcciones de 0 a 100
        for i in 0 to 100 loop
            wait for 10 ns;
            
            user_data 	<= std_logic_vector(to_unsigned(i, 32));  -- Datos de prueba
				
            -- Esperamos a que se complete la escritura
            wait for 10 ns;

        end loop;

        wait;
    end process;

end behavior;

