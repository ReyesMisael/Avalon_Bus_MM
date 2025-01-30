
-- Library Clause(s) (optional)
-- Use Clause(s) (optional)


entity top is
	generic
	(
		<name>	: <type>  :=	<default_value>;
		...
		<name>	: <type>  :=	<default_value>
	);


	port
	(
		-- Input ports
		<name>	: in  <type>;
		<name>	: in  <type> := <default_value>;

		-- Inout ports
		<name>	: inout <type>;

		-- Output ports
		<name>	: out <type>;
		<name>	: out <type> := <default_value>
	);
end top;




architecture top_arch of top is

	-- Declarations (optional)

begin

	-- Process Statement (optional)

	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)

end top;
