depth = -bbox_bottom /// o personajen fica na fente 



#region ////////  MOVIMENTAÇÃO DO JOGADOR


//define os vetores de entrada.
var vetor_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var vetor_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

//velocidade base
var velocidade = max_vel;

//calculo hipotenusa
var qud_hip = (vetor_x * vetor_x) + (vetor_y * vetor_y);

if (qud_hip > 0)
{
    var hip = sqrt(qud_hip);

    //divide pela hipotenusa
    vetor_x /= hip;
    vetor_y /= hip;

    // Define velh e velv finais 
    velh = vetor_x * velocidade;
    velv = vetor_y * velocidade;
}
else
{
    velh = 0;
    velv = 0;
}


#endregion////////////////




#region//////// COLISÃO HORISONTAL

var _sign_h = sign(velh);

repeat(abs(velh)) {
    if (place_meeting(x + _sign_h, y, obj_parede))
	{
        velh = 0;
        break; // Para o loop se bater na parede
    }
	else
	{
        x += _sign_h;
    }
}


#endregion////////////////




#region////// COLISÃO VERTICAL

var _sign_v = sign(velv);

repeat(abs(velv)) {
    if (place_meeting(x, y + _sign_v, obj_parede)) 
	{
        velv = 0;
        break; // para o loop se bater na parede
    }
	else 
	{
        y += _sign_v;
    }
}

#endregion/////////////



#region//////////// TROCA DE SPRITES 

// para qual lado ele está 
if (velh > 0) lado = 2; // Direita
if (velh < 0) lado = 3; // Esquerda
if (velv > 0) lado = 0; // Baixo
if (velv < 0) lado = 1; // Cima

// escolher a sprite
if (velh != 0 || velv != 0) 
{
    // Se está se movendo
    if (lado == 0) sprite_index = Spr_movendo_baixo;
    if (lado == 1) sprite_index = Spr_movendo_cima;
    if (lado == 2) sprite_index = Spr_movendo_direita;
    if (lado == 3) sprite_index = Spr_movendo_esquerda;
} 
else 
{
    // Se está parado
    if (lado == 0) sprite_index = Spr_parado_baicho;
    if (lado == 1) sprite_index = Spr_parado_cima;
    if (lado == 2) sprite_index = Spr_parado_direita;
    if (lado == 3) sprite_index = Spr_parado_esquerda;
}

#endregion/////////////////


#region///////////// FICA VERMELHO QUANDO LEVA DANO


var _dt = delta_time / 1000000;

// piscar vermelho
if (hit_timer > 0) 
{
    hit_timer -= _dt;
    image_blend = c_red;
}
else 
{
    image_blend = c_white;
}


#endregion-///////////

// MORTE DO JOGADOR

scr_jogador_controle_timers();

if (hp <= 0) 
{
    room_restart();
}