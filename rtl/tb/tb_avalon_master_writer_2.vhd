


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Declaración del testbench para el avalon_master_writer_2
entity tb_avalon_master_writer_2 is
end tb_avalon_master_writer_2;

architecture behavior of tb_avalon_master_writer_2 is
	
	
    -- Señales de prueba (para conectar al UUT)
    signal clk               : STD_LOGIC := '0';  -- Señal de reloj
    signal reset_n           : STD_LOGIC := '1';  -- Reset activo bajo
    signal write             : STD_LOGIC;          -- Señal de escritura
    signal chipselect        : STD_LOGIC;          -- Señal de chipselect
    signal address           : STD_LOGIC_VECTOR(31 downto 0);  -- Dirección
    signal byteenable        : STD_LOGIC_VECTOR(3 downto 0);   -- Habilitación de bytes
    signal writedata         : STD_LOGIC_VECTOR(31 downto 0);  -- Datos de escritura
    signal writeresponsevalid : STD_LOGIC := '0'; -- Respuesta de la escritura
    signal response          : STD_LOGIC_VECTOR(1 downto 0) := "00";  -- Respuesta de escritura
    signal waitrequest       : STD_LOGIC := '0';  -- Señal de espera

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
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    -- Generador de señales de prueba
    stimulus: process
    begin
        -- Inicialización
        reset_n <= '0';  -- Activamos reset
        wait for 20 ns;   -- Esperamos a que el reset se propague
        reset_n <= '1';   -- Desactivamos reset

        -- Simulamos datos para la FIFO
        user_data <= x"00000001"; -- Datos de prueba
        user_wrreq <= '1';
        user_wrclk <= '1';
        wait for 10 ns;
        user_wrclk <= '0';
        wait for 10 ns;
        user_wrreq <= '0';

        -- Esperamos antes de escribir en la memoria
        wait for 20 ns;

        -- Simulamos un ciclo de escritura
        -- Activamos la señal de escritura
        writeresponsevalid <= '1'; -- Respuesta válida de escritura
        response <= "00";          -- Respuesta de escritura exitosa
        wait for 10 ns;

        -- Iniciamos la escritura en la memoria
        write <= '1';
        chipselect <= '1';
        address <= x"00000000";  -- Dirección de escritura
        byteenable <= "1111";    -- Habilitamos los 4 bytes
        writedata <= q_sig;     -- Datos de la FIFO

        -- Esperamos a que se complete la escritura
        wait for 20 ns;

        -- Terminamos el ciclo de escritura
        write <= '0';
        chipselect <= '0';

        -- Verificamos la salida después de la escritura
        assert (address = x"00000000") report "Error: Dirección incorrecta" severity error;
        assert (write = '1') report "Error: La señal de escritura no está activa" severity error;

        -- Generamos más datos para la FIFO y más escrituras
        user_data <= x"00000002"; -- Nuevos datos de prueba
        user_wrreq <= '1';
        user_wrclk <= '1';
        wait for 10 ns;
        user_wrclk <= '0';
        wait for 10 ns;
        user_wrreq <= '0';

        -- Esperamos un ciclo más y realizamos otra escritura
        wait for 20 ns;
        write <= '1';
        chipselect <= '1';
        address <= x"00000004";  -- Siguiente dirección de memoria
        writedata <= q_sig;     -- Datos de la FIFO

        -- Terminamos el ciclo de escritura
        wait for 20 ns;
        write <= '0';
        chipselect <= '0';

        -- Fin de la simulación
        wait;
    end process;

end behavior;
