event_inherited(); // (pegar, seguir, mirar, inverter)

// Cálcula o tempo
var _dt = delta_time / 1000000;

// Diminui o daley_tiro baseado no tempo que passou
if (recarga_tiro > 0) recarga_tiro -= _dt;

#region//// RECAREGAR A ARMA, RECAREGA COM O BOOTAM ESQUERDO

if (na_mao && keyboard_check_pressed(mb_right) && balas_atuais < 15 && !recarregando) 
{
    recarregando = true;
    recarga_tiro = 0.001; // Trava a arma por 2.5 segundos
    
}

#endregion////////////////////////


#region /////////////// PARA DE RECAREGAR QUANDO O TEMPO ACABA
if (recarregando && recarga_tiro <= 0) 
{
    balas_atuais = 15;
    recarregando = false;
}


#endregion///////////////


#region////////// TIRO

if (na_mao && mouse_check_button(mb_left) && recarga_tiro <= 0 && !recarregando)
{
    if (balas_atuais > 0) 
    {
        balas_atuais -= 1; // Gasta munição
        recarga_tiro = espera_tiro; // Reseta o cronômetro (0.33)

        // Calcula a ponta do cano
        var _x = lengthdir_x(20, image_angle);
        var _y = lengthdir_y(20, image_angle);

        // Cria a bala
        var _inst = instance_create_depth(x + _x, y + _y, depth, Obj_tiro);

        if (instance_exists(_inst)) 
        {
            // Se usar delta_time na velocidade, o valor de 'velocidade_tiro' 
            // deve ser alto (ex: 600 ou mais) para compensar o _dt pequeno.
            _inst.speed = velocidade_tiro * _dt; 
            _inst.direction = image_angle;
            _inst.image_angle = image_angle;
            _inst.dano = self.dano;
        }
    }
    else 
    {
        // Som de "click" sem bala ou iniciar recarga automática
        // recarregando = true; daley_tiro = 2.5; 
	}
	
	 
        // Debug para você ter certeza que o código rodou
        show_debug_message(" quantidade de balas atuais : " + string(balas_atuais));
}

#endregion/////////////////////