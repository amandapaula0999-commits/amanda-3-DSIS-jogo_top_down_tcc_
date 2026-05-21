event_inherited(); 

var _dt = delta_time / 1000000;

// diminui os dois taimes 
if (daley_tiro > 0)   daley_tiro -= _dt;   // Tempo entre balas (0.33) esta no pai 
if (recarga_tiro > 0) recarga_tiro -= _dt; // Tempo de recarga (2.5)

#region ///////////// RECAREGANDO 

//// recarega com o button esquerdo 
if (na_mao && mouse_check_button_pressed(mb_left) && balas_atuais < 1 && !recarregando) 
{
    recarregando = true;
    recarga_tiro = 2.5; 
    show_debug_message("Recarregando...");///// PODE APAGADO 
}

//// para de regar quando acabar o tempo 

if (recarregando && recarga_tiro <= 0) 
{
    balas_atuais = 15;
    recarregando = false;
    show_debug_message("Recarregado!"); ////////////PODE APAGAR 
}

#endregion///////////

#region //////////////TIRO

// tiver na mão, apertar o botão, NÃO estiver recarregando e o daley_tiro for 0
if (na_mao && mouse_check_button(mb_left) && !recarregando && daley_tiro <= 0)
{
    if (balas_atuais > 0) 
    {
        balas_atuais -= 1;
        daley_tiro = espera_tiro; //tempo entre tiros 

        var _x = lengthdir_x(20, image_angle); /// cria o obj_tiro 
        var _y = lengthdir_y(20, image_angle);/// cria o obj_tiro 
        var _inst = instance_create_depth(x + _x, y + _y, depth, Obj_tiro);/// cria o obj_tiro 

        if (instance_exists(_inst)) 
        {
            _inst.speed = velocidade_tiro * _dt; 
            _inst.direction = image_angle;
            _inst.image_angle = image_angle;
            _inst.dano = self.dano;
        }
    } 
	else 
	{
        show_debug_message("Sem balas! Recarregue no botão direito.");
    }
	   show_debug_message("quantidade de balas : " + string(balas_atuais));

}

#endregion