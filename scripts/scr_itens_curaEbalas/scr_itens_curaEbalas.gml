#region//////KIT DE CURA 



function scr_gerenciar_kit_cura() 
{

#region////////PEGAR 

    if (!peguei) 
    {
        if (distance_to_object(Obj_jogador) < 40 && keyboard_check_pressed(ord("E"))) 
        {
            peguei = true;
            Obj_jogador.kits_na_mao += 1;
            Obj_jogador.ocupado = true;
            speed = 0; 
        }
    }
	
#endregion/////////////
    

	
    else 
    {

#region////// SEGUE O JOGADOR R O MOUSE 

        // Segue o jogador
        x = Obj_jogador.x;
        y = Obj_jogador.y;
		// Procure por essa linha e adicione o + 90 no final:
		image_angle = point_direction(x, y, mouse_x, mouse_y) + 90;
        visible = true; //// So o visivel 

#endregion/////////////

#region////TOPO DA PILHA

        // Último kit pego (topo da pilha)
        var _ultimo_id = noone;
        with(Obj_cura_vida) 
        {
            if (peguei) _ultimo_id = id; 
        }
		
#endregion/////////
 

        // Só executa se for o kit ativo (O DO TOPO)
        if (id == _ultimo_id) 
        {

#region///////////// ARREMESO 

            // ARREMESSAR COM "E"
            if (keyboard_check_pressed(ord("E"))) 
            {
                peguei = false;
                Obj_jogador.kits_na_mao -= 1; /// Usa o kit 
                
                if (Obj_jogador.kits_na_mao <= 0) Obj_jogador.ocupado = false; 
                
                direction = point_direction(x, y, mouse_x, mouse_y); //// para onde é aremesado 
                speed = 10; /// velocidade 
            }
			
#endregion///////////////

            // USAR (CURAR) COM O BOTÃO ESQUERDO
            if (mouse_check_button_pressed(mb_left)) 
            {
				
#region/////////USAR, TEMPO PARA USAR DE NOVO, FALA 

                // checa se esta na espera 
                if (Obj_jogador.cooldown_cura > 0) 
                {
                    // Calcula quantos minutos e segundos faltam para exibir na mensagem
                    var _segundos_restantes = ceil(Obj_jogador.cooldown_cura);
                    var _minutos = _segundos_restantes div 60;
                    var _segundos = _segundos_restantes mod 60;
                    
                    // Formata o texto ex: "Ainda não posso! Faltam 0:6"
                    var _texto_tempo = string(_minutos) + ":" + (_segundos < 10 ? "0" : "") + string(_segundos);
                    
                    Obj_jogador.texto_fala = "Ainda não posso! Faltam " + _texto_tempo;
                    Obj_jogador.timer_fala = 60;
                }
				
#endregion///////////////////


				
                // SE NÃO ESTIVER EM COOLDOWN, CHECA A VIDA
                else if (Obj_jogador.hp < Obj_jogador.hp_max) 
                {
					
#region//////// TEMPO DE ESPERA PARA USAR, CURA 4,SE CURA FALA, SE NÃO NÃO FALA
					
                    Obj_jogador.hp += 4;
                    if (Obj_jogador.hp > Obj_jogador.hp_max) Obj_jogador.hp = Obj_jogador.hp_max;
                    
                    Obj_jogador.texto_fala = "Me sinto melhor agora";
                    Obj_jogador.timer_fala = 60;
                    
                    // Espera 6 segundos 
                    Obj_jogador.cooldown_cura = 6; 
                    
                    Obj_jogador.kits_na_mao -= 1;
                    if (Obj_jogador.kits_na_mao <= 0) Obj_jogador.ocupado = false;
                    
                    instance_destroy();
					
					io_clear(); // Limpa o clique do mouse para o próximo kit não ler!
                } 
                else 
                {
                    Obj_jogador.texto_fala = "Eu não estou mal";
                    Obj_jogador.timer_fala = 60;
                }
            }
        }
    }
	
#endregion//////////////

    // Colisão com paredes
    if (place_meeting(x + hspeed, y + vspeed, obj_parede)) 
    {
        speed = 0;
    }
}

#endregion////////////////// KIT DE CURA 