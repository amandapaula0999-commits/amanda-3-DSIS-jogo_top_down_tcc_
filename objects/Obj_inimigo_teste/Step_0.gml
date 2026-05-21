if (scr_inimigo_morte_fade()) return; // Se morreu, para o código

scr_inimigo_controle_visual(); // Pisca vermelho
estado(); // Executa a perseguição ou patrulha

#region ///////////EXECUTA O ESTADO(TRAVA DE SEGURANÇA)

if (estado != noone) //se tem aguma coisa para fazer faça 
{
    estado();
}

#endregion/////////////////////////

depth = -bbox_bottom; 

#region //////////COLISÃO E MOVIMENTO HORIZONTAL E VERTICAL


#region ////////// Colisão Horizontal

if (place_meeting(x + velh, y, obj_parede))// Eu vou bater ?
{
    while (!place_meeting(x + sign(velh), y, obj_parede))//Sim, para as poucos ate encostar na parede 
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

// Aplica a direção do desenho
if (velh != 0) 
{
    image_xscale = sign(velh); 
}
 
 
 #endregion////////////////


