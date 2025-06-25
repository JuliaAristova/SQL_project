SELECT 
 ROUND(12.355143, 2) twoDecimal,
 ROUND(12.355143) nearestWhole,
 ROUND(259.99, -1) negOne,
 CEIL (12.355143) ceilNum,
 FLOOR(12.355143) floorNum,
 TRUNC(12.233143, 2) truncTo2decimal,
 TRUNC(259.99, -1) truncNegOne,
 REMAINDER(9,3) rem1,
 REMAINDER(10,3) rem2,
 REMAINDER(11,3) rem3,
 MOD(9,3) mod1,
 MOD(10,3) mod2,
 MOD(11,3) mod3
FROM DUAL;
