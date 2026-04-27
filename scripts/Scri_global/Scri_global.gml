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

#endregion//////////////////////////////////////////////////////////////////////



	




