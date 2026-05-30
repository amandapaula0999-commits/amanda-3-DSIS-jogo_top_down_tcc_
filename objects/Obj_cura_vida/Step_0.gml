#region //// PEGAR E CHECAR SE TEM ALGO NA MÃO 

if (!peguei)
{
    if (distance_to_object(Obj_jogador) < 40 && keyboard_check_pressed(ord("E")))
	{
        peguei = true;
        Obj_jogador.kits_na_mao += 1;
        Obj_jogador.ocupado = true;
    }
} 

#endregion///


else
{
#region /// SEGUE VOCÊ E O RATO E DEIXA O ULTINO VISIVEL 
    // 
    x = Obj_jogador.x;// Segue o jogador 
    y = Obj_jogador.y;
    image_angle = point_direction(x, y, mouse_x, mouse_y);// Segue o mouse 
    
    // Se fo o ultimo que pego apatrece no topo 
    visible = true; 

#endregion /////

#region///	ARREMESO

    // ARREMESSAR COM "E"
    if (keyboard_check_pressed(ord("E")))
	{
        peguei = false;
        Obj_jogador.kits_na_mao -= 1;
        
        // Direção do arremesso baseada no mouse
        var _dir = point_direction(x, y, mouse_x, mouse_y);
        direction = _dir;
        speed = 8; // Velocidade do arremesso
        friction = 0.2; // Vai parando aos poucos no chão
        
        if (Obj_jogador.kits_na_mao <= 0) Obj_jogador.ocupado = false;
    }

#endregion///////


#region///SO PODE USAR UM POR VEZ, CURA COM FALA 

   ////SO PODE USAR UM POR VEZ
    if (mouse_check_button_pressed(mb_left) && visible) 
	{
        if (Obj_jogador.hp < Obj_jogador.hp_max) 
		{
            // CURA
            Obj_jogador.hp += 4;
            if (Obj_jogador.hp > Obj_jogador.hp_max) Obj_jogador.hp = Obj_jogador.hp_max;
            
            Obj_jogador.texto_fala = "Me sinto melhor agora";
            Obj_jogador.timer_fala = 120;
            
            Obj_jogador.kits_na_mao -= 1;
            if (Obj_jogador.kits_na_mao <= 0) Obj_jogador.ocupado = false;
            
            instance_destroy(); // Esse kit some
        }
		else
		{
            // VIDA CHEIA
            Obj_jogador.texto_fala = "Eu não estou mal";
            Obj_jogador.timer_fala = 120;
        }
    }
}

#endregion////////////////////