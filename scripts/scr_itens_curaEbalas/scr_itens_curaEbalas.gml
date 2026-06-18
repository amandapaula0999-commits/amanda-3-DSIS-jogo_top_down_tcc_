#region///////////// KIT DE VIDA 

function scr_gerenciar_kit_cura() 
{
#region/////// PEGAR, CHECAR SE TEM ALGUMA COISA NA MÃO  
  
    if (!peguei) 
    {
        if (distance_to_object(Obj_jogador) < 40 && keyboard_check_pressed(ord("E"))) 
        {
            peguei = true;
            Obj_jogador.kits_na_mao += 1;
            speed = 0; 
        }
    } 

#endregion///////////////

    else 
    {
#region////////////////// SEGUE O JOGADOR, ELE FICA INVISIVEL NA MÃO 

        // Segue o jogador 
        x = Obj_jogador.x;
        y = Obj_jogador.y;
        visible = false; ///fica invisivel
        
#endregion///////////////// 
           
#region/////////////USAR, TEMPO DE ESPERA,COMENTARIO, NÃO CURA SE ESTIVER BEM, É DESTRUIDO APOS USADO 
            
        // USAR (CURAR) COM O BOTÃO ESQUERDO
		if (mouse_check_button_pressed(mb_left)) 
		{
            // Checa o tempo de espera da cura
            if (Obj_jogador.cooldown_cura > 0) 
            {
                var _segundos_restantes = ceil(Obj_jogador.cooldown_cura);
                var _minutos = _segundos_restantes div 60;
                var _segundos = _segundos_restantes mod 60;
                var _texto_tempo = string(_minutos) + ":" + (_segundos < 10 ? "0" : "") + string(_segundos);
                
                Obj_jogador.texto_fala = "Ainda não posso! Faltam " + _texto_tempo;
                Obj_jogador.timer_fala = 60; 
            }
            // Cura se a vida não estiver cheia
            else if (Obj_jogador.hp < Obj_jogador.hp_max) 
            {
                Obj_jogador.hp += 4;
                if (Obj_jogador.hp > Obj_jogador.hp_max) Obj_jogador.hp = Obj_jogador.hp_max;
                
                Obj_jogador.texto_fala = "Me sinto melhor agora";
                Obj_jogador.timer_fala = 60;
                Obj_jogador.cooldown_cura = 6; 
                
                Obj_jogador.kits_na_mao -= 1;
                
                instance_destroy(); // Destrói o item usado direto da mochila
                
                io_clear();
            } 
            else 
            {
                Obj_jogador.texto_fala = "Eu não estou mal";
                Obj_jogador.timer_fala = 90;
            }
        }
#endregion////////////////////
    }
}

#endregion///////////////


#region/////////////CIXA DE PREGOS 

function scr_gerenciar_caixa_pregos() 
{
    // (menos de 40 pixels) e apertar "E"
    if (distance_to_object(Obj_jogador) < 40 && keyboard_check_pressed(ord("E"))) 
    {
        // Checa se a arma existe na sala para poder entregar a munição
        if (instance_exists(Obj_beretta_92FS)) 
        {
            Obj_beretta_92FS.caixas_municao += 1; // Adiciona 1 caixa direto na arma
            
            //fala do jogador PODE APAGAR  
            Obj_jogador.texto_fala = "Peguei pregos!"; //ESSE 
            Obj_jogador.timer_fala = 45;//ESSE
        }
        
        instance_destroy(); // A caixa some do chão 
    }
}


#endregion///////////////////////////

