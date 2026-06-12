event_inherited(); 

var _dt = delta_time / 1000000; // tempo 

// diminui os dois timers 
if (daley_tiro > 0)   daley_tiro -= _dt;   // Tempo entre balas (0.33)
if (recarga_tiro > 0) recarga_tiro -= _dt; // Tempo de recarga (2.5)

#region ///////////// recarga 

// O JOGADOR APERTA "R" PARA RECARREGAR
if (na_mao && keyboard_check_pressed(ord("R")) && !recarregando) 
{
    // So recarega se nã tiver bala 
    if (balas_atuais < max_balas) 
    {
        //Se ele tiver caixas de munição guardadas
        if (caixas_municao > 0) 
        {
            recarregando = true;
            recarga_tiro = tempo_recarga_alvo; // Ativa os 2.5 segundos de espera
            caixas_municao -= 1;               // Gasta 1 caixa de pregos
            
            Obj_jogador.texto_fala = "Recarregando pregadora...";
            Obj_jogador.timer_fala = 90;
            
            show_debug_message("Jogador iniciou a recarga. Caixas restantes: " + string(caixas_municao)); //APAGAR
        }
        else 
        {
            // Se não tiver munição 
            Obj_jogador.texto_fala = "Sem caixas de prego para recarregar!";
            Obj_jogador.timer_fala = 60;
        }
    }
    else 
    {
        // Se ja tem balas 
        Obj_jogador.texto_fala = "A arma já está cheia!";
        Obj_jogador.timer_fala = 45;
    }
}

// Termina de recarregar quando o tempo do timer acabar 
if (recarregando && recarga_tiro <= 0) 
{
    balas_atuais = max_balas; // Enche o pente para 15
    recarregando = false;
    
    Obj_jogador.texto_fala = "Pregadora pronta!";
    Obj_jogador.timer_fala = 60;
    
    show_debug_message("Recarregado com sucesso!"); //APAGAR
}

#endregion///////////

#region //////////////TIRO

// Se estiver na mão, apertar ou segurar o botão, NÃO estiver recarregando e o daley_tiro for 0
if (na_mao && mouse_check_button(mb_left) && !recarregando && daley_tiro <= 0)
{
    if (balas_atuais > 0) 
    {
        balas_atuais -= 1;
        daley_tiro = espera_tiro; // tempo entre tiros 

        var _x = lengthdir_x(20, image_angle); /// cria o obj_tiro 
        var _y = lengthdir_y(20, image_angle);/// cria o obj_tiro 
        var _inst = instance_create_depth(x + _x, y + _y, depth, Obj_tiro);/// cria o obj_tiro 

        if (instance_exists(_inst)) 
        {
            _inst.speed = velocidad_tiro * _dt; 
            _inst.direction = image_angle;
            _inst.image_angle = image_angle;
            _inst.dano = self.dano;
        }
    } 
    else 
    {
        // Se acabarem as balas e ele tentar atirar
        Obj_jogador.texto_fala = "Sem balas! Aperte R para recarregar.";
        Obj_jogador.timer_fala = 30;
        show_debug_message("Pente vazio! Recarga manual necessária."); // APAGAR
    }
    show_debug_message("quantidade de balas : " + string(balas_atuais));// APAGAR 
}

#endregion

