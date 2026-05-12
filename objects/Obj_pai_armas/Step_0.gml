

#region////// PEGAR E LAGAR A ARMA 

if (!instance_exists(Obj_jogador)) return;

var _distancia = point_distance(x, y, Obj_jogador.x, Obj_jogador.y);
var _tecla_pegar = keyboard_check_pressed(ord("E"));

if (_distancia <= 70 && _tecla_pegar) 
{ //distancia para pegar 
    na_mao = !na_mao; // pega se estver no chão larga se estiver na mão 
}

// Se não estiver na mão, o código para aqui 
if (!na_mao) return; 

#endregion


#region////	 SEGUIR O JOGADOR 

x = Obj_jogador.x;
y = Obj_jogador.y;
depth = Obj_jogador.depth - 1;

#endregion////////////

#region////	 tempo entre tiros

var _dt = delta_time / 1000000;
if (daley_tiro > 0) daley_tiro -= _dt;

#endregion/////////

#region///REGUE O MOUSE 

image_angle = point_direction(x, y, mouse_x, mouse_y);

if (image_angle > 90 && image_angle < 270)
{
    image_yscale = -1; // Inverte para cima quando aponta para a esquerda
} 
else
{
    image_yscale = 1;

}

#endregion///////////