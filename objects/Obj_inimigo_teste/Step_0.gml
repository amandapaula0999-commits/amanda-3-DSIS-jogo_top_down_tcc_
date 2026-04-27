#region /////////executa o estado, uma trava de segurança que verifica o que ele deve fazer

if (estado != noone) 
{
    estado();
}

#endregion/////////////////////////

depth = -bbox_bottom; 

#region //////////COLISÃO E MOVIMENTO HORIZONTAL E VERTICAL


#region ////////// Colisão Horizontal

if (place_meeting(x + velh, y, obj_parede))
{
    while (!place_meeting(x + sign(velh), y, obj_parede))
	{
        x += sign(velh);
    }
    velh = 0;
}
x += velh;

#endregion///////////////



 #region ///////////// Colisão Vertical 
 
if (place_meeting(x, y + velv, obj_parede))
{
    while (!place_meeting(x, y + sign(velv), obj_parede))
	{
        y += sign(velv);
    }
    velv = 0;
}
y += velv;

#endregion///////////
 
 
 #endregion////////////////

#region//////////// bara de vida

var _dt = delta_time / 1000000;
var _largura_inimigo = bbox_right - bbox_left;

largura_barra_total = _largura_inimigo;
x_barra = x - (largura_barra_total / 2);

// atraso da barra laranja
if (hp_secundario > hp)
{
    if (delay_barra > 0) 
	{
        delay_barra -= _dt; 
    } 
	else 
	{
        hp_secundario = lerp(hp_secundario, hp, 0.1); 
        if (hp_secundario - hp < 0.05) hp_secundario = hp;
    }
}


if (hp <= 0) 
{
    instance_destroy(); // O inimigo some quando a vida acaba
}

#endregion/////



#region//////// fica vermelho quando atacado 

_dt = delta_time / 1000000;

// piscar vermelho 
if (hit_timer > 0) 
{
    hit_timer -= _dt;
    image_blend = c_red; // enquanto o timer for maior que 0, fica vermelho
} 
else 
{
    image_blend = c_white; // Quando zerar, volta ao normal
}

// barra de vida
if (hp <= 0) instance_destroy();



#endregion/////////////////


var mata = keyboard_check_pressed(ord("K"))

if  (mata)
{
  hp -= 1;	
}