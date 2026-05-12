#region//////////////// expecificações do inimigo 


#region////////////// estado parado que pode mudar para andando

function scr_inimigo_parado()
{
    sprite = Spr_inimigo_parado;
    velh = 0;
    velv = 0;
    
    //o estado pode mudar para uma d
    muda_estado([scr_inimigo_andando, scr_inimigo_parado]);
}

#endregion//////////////////



#region//////// estado do inimigo andando,

function scr_inimigo_andando() 
{
    sprite = Spr_inimigo_andando;
    var _dt = delta_time / 1000000;
    
    var _dist = point_distance(x, y, destino_x, destino_y);
    
    if (_dist < 20) 
	{	//// ele so pode ir a uma distancia de 20 px 
		
        destino_x = random(room_width);
        destino_y = random(room_height);
    }
    
    var _dir = point_direction(x, y, destino_x, destino_y);
    
    velh = lengthdir_x(vel * _dt, _dir);
    velv = lengthdir_y(vel * _dt, _dir);
    
    if (velh != 0)
	{
        xscale = sign(velh); 
    }
    
    muda_estado([scr_inimigo_parado, scr_inimigo_andando]);
}

#endregion////////////////////


#region//////estado perseguindo 

function scr_inimigo_persegue()
{
    image_blend = c_fuchsia; ///////////// TROCA DE COR(APAGAR)
    var _dt = delta_time / 1000000;
    
    if (instance_exists(Obj_jogador))
	{
        var _distancia = point_distance(x, y, Obj_jogador.x, Obj_jogador.y);
        
        // rersegue se estiver a 200 px 
        if (_distancia <= 500) 
		{ 
            var _dir = point_direction(x, y, Obj_jogador.x, Obj_jogador.y);
            velh = lengthdir_x((vel * 1.5) * _dt, _dir);
            velv = lengthdir_y((vel * 1.5) * _dt, _dir);
            
            if (velh != 0) xscale = sign(velh);
        } 
        else
		{
            // passo de 200 px ele desiste
            image_blend = c_white; ////////////////////////// TROCA DE COR(APAGAR)
            velh = 0;
            velv = 0;
            tempo_estado = 2; // tempo parado antes de voltar a patrulhar
            estado = scr_inimigo_parado; 
        }
    }
}	
   


#endregion////////////////////////////////////////////////////


#region///////////////vida

#region///////barra de vida 

// Função para desenhar a barra de vida 
function scr_desenhar_barra_vida(_largura = 40, _altura = 5, _distancia_y = 50)
{
    if (hp_atual > 0) 
    {
        var _x1 = x - (_largura / 2);
        var _y1 = y - _distancia_y;
        var _porcentagem = (hp_atual / hp_max) * 100;

        // Desenha fundo preto e barra que muda de verde para laranja
        draw_healthbar(_x1, _y1, _x1 + _largura, _y1 + _altura, _porcentagem, c_black,c_orange, c_red, 0, true, true);
    }
}

// morte 
function scr_inimigo_morte_fade()
{
    // Verifica se a variável hp_atual existe 
    if (variable_instance_exists(id, "hp_atual")) 
    {
        if (hp_atual <= 0) 
        {
            mask_index = -1;
            image_speed = 0;
            velh = 0;
            velv = 0;
            
            image_alpha -= 0.02;
            
            if (image_alpha <= 0) 
            {
                instance_destroy(); // destrói se tiver HP e chegar a 0
            }
            return true;
        }
    }
    return false;
}


#endregion/////////////////



#region////////////dano 

function scr_inimigo_receber_dano(_dano) 
{
    // Verificamos se o inimigo ainda tem vida antes de tirar dano
    if (hp_atual > 0) 
    {
        hp_atual -= _dano;
        image_blend = c_red;
        hit_timer = 10;
        
        // Debug para você ter certeza que o código rodou
        show_debug_message("Inimigo atingido! Vida atual: " + string(hp_atual));
    }
}


function scr_inimigo_controle_visual()
{
    
    if (hit_timer > 0) 
	{
        hit_timer--;
    } 
	else 
	{
        image_blend = c_white;
    }
}

#endregion//////////



#endregion//////////////



#endregion//////////////////////////////////////////////////////////////////////


#region///////////////jogador

#region///////////barra de vida

function scr_jogador_receber_dano(_valor)
{
    // código a olhar para o Obj_jogador
    with(Obj_jogador)
    {
        if (invulneravel_timer <= 0) 
        {
            hp -= _valor;
            hit_timer = 10;          // Pisca vermelho por 10 frames
            invulneravel_timer = 60; // 1 segundo de proteção (a 60 FPS)
        }
    }
}

function scr_jogador_controle_timers()
{
    // piscar vermelho
    if (hit_timer > 0) 
	{
        hit_timer--;
        image_blend = c_red;
    } 
	else
	{
        image_blend = c_white;
    }

    // invencibilidade
    if (invulneravel_timer > 0)
	{
        invulneravel_timer--;
        image_alpha = 0.5; // Fica "fantasma" enquanto protegido
    } 
	else
	{
        image_alpha = 1.0;
    }
}

#endregion/////////////////////////

#endregion/////////////////////



	




