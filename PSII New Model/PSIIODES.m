function dydt = PSIIODES (t,y,k) % 'ODE' for 'Ordinary Differential Equation'
 
dydt = zeros(31,1); 

if rem(t/50,2) <1
    h = 1;
%     dummy = 0.01;
else
    h = 0;
%     dummy = -0.01;
end

r(1) = h*k(1)*y(1);
r(2) = k(2)*y(2)*y(4);
r(3) = k(3)*y(3)*y(70);
r(4) = k(4)*y(5)*y(6);
r(5) = k(5)*y(7)*y(8);
r(6) = k(6)*y(7)*y(9)*y(58);
r(7) = k(7)*y(10)*y(58);
r(8) = k(8)*y(11);
r(9) = k(9)*y(12)*y(13);
r(10) = k(10)*y(14)*y(16);
r(11) = k(11)*y(15);
r(12) = k(12)*y(20)*y(17);
r(13) = k(13)*y(21);
r(14) = k(14)*y(22)*y(24);
r(15) = k(15)*y(25)*y(30);
r(16) = k(16)*y(26);
r(17) = k(17)*y(27)*y(23);
r(18) = h*k(18)*y(28);
r(19) = k(19)*y(29)*y(31);
r(20) = k(20)*y(31)*y(33);
r(21) = k(21)*y(34)*y(35);
r(22) = k(22)*y(36)*y(37);
r(23) = k(23)*y(38)*y(39);
r(24) = k(24)*y(40)*y(41);
r(25) = k(25)*y(42);
r(26) = k(26)*y(43)*y(48);
r(27) = k(27)*y(44)*y(49);
r(28) = k(28)*y(45);
r(29) = k(29)*y(46)*y(47);
r(30) = k(30)*y(51)*y(52);
r(31) = k(31)*y(53)*y(50)*y(58);
r(32) = k(32)*y(54);
r(33) = k(33)*y(55);
r(34) = k(34)*y(59)*y(56);
r(35) = k(35)*y(55)*y(57);
r(36) = k(36)*y(57);
r(37) = k(37)*y(2);
r(38) = k(38)*y(3)*y(7);
r(39) = k(39)*y(43);
r(40) = k(40)*y(61);
r(41) = k(41)*y(62);
r(42) = k(42)*y(18)*y(64);
r(43) = k(43)*y(65)*y(63);
r(44) = k(44)*y(68)*y(58)*y(17);
r(45) = k(45)*y(66)*y(58);
r(46) = k(46)*y(46)*y(67);
r(47) = k(47)*h*y(69);

dydt(1) = -r(1) + r(3) + r(37) + r(38);
dydt(2) = r(1) - r(2) - r(37); 
dydt(3) = r(2) - r(3) - r(38);
dydt(4) = r(4) - r(2);
dydt(5) = r(2) - r(4);
dydt(6) = -r(4) + r(5) + r(6) +r(38);
dydt(7) = -r(5) - r(6) + r(4) -r(38);
dydt(8) = -r(5);
dydt(9) = r(5) - r(6);
dydt(10) = r(6) - r(7); 
dydt(11) = -r(5) + r(7);
dydt(12) = r(8) - r(9) +r(46);
dydt(13) = -r(9) + r(11);
dydt(14) = r(9) - r(10); 
dydt(15) = r(10) - r(11);
dydt(16) = r(12) - 2*r(10);
dydt(17) = 2*r(10) - r(12) - r(44); 
dydt(18) = r(11) - r(42); 
dydt(19) = r(8);
dydt(20) = -r(12) + r(17); 
dydt(21) = r(12) - r(13); 
dydt(22) = r(13) - r(14); 
dydt(23) = -r(17);
dydt(24) = -r(14) + r(16);
dydt(25) = -r(15) + r(14);
dydt(26) = r(15) - r(16); 
dydt(27) = r(16) - r(17); 
dydt(28) = r(15) - r(18); 
dydt(29) = r(18) - r(19); 
dydt(30) = r(19) - r(15); 
dydt(31) = -r(19) + r(20);
dydt(32) = -r(20) + r(19);
dydt(33) = r(21) - r(20); 
dydt(34) = r(20) - r(21); 
dydt(35) = r(22) - r(21); 
dydt(36) = -r(22) + r(21); 
dydt(37) = -r(22) + r(23); 
dydt(38) = -r(23) - r(22); 
dydt(39) = -r(23) + r(24); 
dydt(40) = -r(24) + r(23); 
dydt(41) = -r(24) + r(29); 
dydt(42) = -r(25) + r(24); 
dydt(43) = r(25) - r(26) - r(39); 
dydt(44) = -r(27) + r(26);
dydt(45) = r(27) - r(28); 
dydt(46) = r(28) - r(29) +r(41);
dydt(47) = r(25) - r(29); 
dydt(48) = -r(26) + r(28);
dydt(49) = -r(27);
dydt(50) = r(27);
dydt(51) = -r(30) + r(33) +2*r(35);
dydt(52) = -r(30);
dydt(53) = -r(31) + r(30);
dydt(54) = -r(32) + r(31);
dydt(55) = +r(32) -r(33) -2*r(35);
dydt(56) = r(36) + 3*r(35) -r(34);
dydt(57) = -r(36) -3*r(35) +r(34); 
dydt(58) = -r(6) + -r(7) + r(34) - r(44) - r(45);
dydt(59) = 2*r(10) -r(34);
dydt(60) = -r(39) + r(41);
dydt(61) = r(39) - r(40); 
dydt(62) = -r(41) + r(40);
dydt(63) = r(40) - r(43); 
dydt(64) = -r(42) + r(46);
dydt(65) = r(42) - r(43);
dydt(66) = -r(43) + r(44);
dydt(67) = -r(46) + r(45);
dydt(68) = -r(44) + r(43);
dydt(69) = 
dydt(70) =

  
end