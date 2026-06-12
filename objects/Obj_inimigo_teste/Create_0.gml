#region/////////////// VARIAVEIS VIDA E DANO 

hp_max = 20;   
hp_atual = hp_max;

dano = 3;


#endregion//////////


#region///////// VARIAVEIS ESTADO E TEMPO 

estado = scr_inimigo_parado;
tempo_estado = 2; 
timer_estado = 0;
hit_timer = 0; // Controla quanto tempo ele fica vermelho

#endregion////////////////

#region///// VARIAVEIS DE MOVIMENTAÇÃO

destino_x = x;
destino_y = y;
velh = 0;
velv = 0;
vel = 100; 

#endregion///////////////

#region////////// VARIAVEIS DE DESENHO

sprite = sprite_index;
yscale = 1;/// trocar o lado 
xscale = 1;
larg_visao = 150;

#endregion//////////




#region MÉTODOS: MUDA DE ESTADO, TEMPO DE MEMORIA, DESENHA A SPRITE(SOMBRA E sprite) E O CAMPO DE VISÃO

tempo_memoria = 0;
///////////////////////

muda_estado = function(_lista_estados)
{
    var _dt = delta_time / 1000000;
    tempo_estado -= _dt;

    if (tempo_estado <= 0) 
	{
        estado = _lista_estados[irandom(array_length(_lista_estados) - 1)];
        tempo_estado = irandom_range(2, 5); 
    }
}
/////////////////////



desenha_sprite = function() //////////
{
    draw_sprite_ext(sprite, image_index, x, y, xscale, yscale, 0, image_blend, image_alpha);
}

/////////////////////////////

///////////////////////////////
desenha_sombra = function() 
{
    draw_sprite_ext(Spr_sombra, 0, x, y + 15, .4, .4, 0, c_white, .25);
}

/////////////////////////////////


///////////////////////
campo_visao = function(_largura, _altura)
{
    // Se já estiver perseguindo, não executa o código abaixo
    if (estado == scr_inimigo_persegue) return noone;

    var _x1 = x;
    var _y1 = y - (_altura / 2);
    // A visão só alcança para onde o xscale aponta
    var _x2 = x + (_largura * xscale); 
    var _y2 = y + (_altura / 2);
    
    var _alvo = collision_rectangle(_x1, _y1, _x2, _y2, Obj_jogador, false, true);
    
    if (_alvo) 
	{
        estado = scr_inimigo_persegue;
        tempo_memoria = 3; 
    }
    
    return _alvo;
}

/////////////////////////


#endregion//////////

