//Calcula a trajetoria do tiro e sua velocidade 
var _dt = delta_time / 1000000;
x += lengthdir_x(500 * _dt, direction);
y += lengthdir_y( 500 * _dt, direction);