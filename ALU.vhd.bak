LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;
ENTITY ALU IS
PORT (Clk : in STD_LOGIC; 
		A , B : in unsigned(7 DOWNTO 0);
		OP : in unsigned(15 DOWNTO 0);
		Neg : out std_logic;
		R1, R2 : out unsigned(3 DOWNTO 0));
END ALU;

ARCHITECTURE Calculation OF ALU IS
signal Reg1, Reg2, Result : unsigned (7 DOWNTO 0) := (others => '0');
BEGIN
	Reg1 <= A;
	Reg2 <= B;
	process(Clk, OP)
	BEGIN
	if(rising_edge(Clk)) then
	case OP is
	WHEN "1000000000000000" =>
			Result <= Reg1 + Reg2;
			neg <= '0';
	WHEN "0100000000000000" =>
			if(Reg1 > Reg2) then
				Result <= Reg1 - Reg2;
				neg <= '0';
			elsif(Reg2 > Reg1) then
				Result <= Reg1 + (NOT Reg2 + 1);
				neg <= '1';
			END if;
	WHEN "0010000000000000" =>
			Result <= NOT Reg1;
			neg <= '0';
	WHEN "0001000000000000" =>
			Result <= Reg1 NAND Reg2;
			neg <= '0';
	WHEN "0000100000000000" =>
			Result <= Reg1 NOR Reg2;	
			neg <= '0';
	WHEN "0000010000000000" =>
			Result <= Reg1 AND Reg2;
			neg <= '0';
	WHEN "0000001000000000" =>
			Result <= Reg1 XOR Reg2;
			neg <= '0';
	WHEN "0000000100000000" =>
			Result <= Reg1 OR Reg2;
			neg <= '0';
	WHEN "0000000010000000" =>
			Result <= Reg1 XNOR Reg2;
			neg <= '0';
	WHEN OTHERS =>
END case;
END if;
END process;
R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);
End Calculation;