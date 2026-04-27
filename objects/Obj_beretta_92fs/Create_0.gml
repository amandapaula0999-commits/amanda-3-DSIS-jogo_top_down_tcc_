atirar = true;
daley_tiro = 0; 
na_mao = false; //a arma começa "no chão" 


espera_tiro = 0.2;     // 0.2 segundos entre tiros
velocidade_tiro = 600; 
objeto_tiro = Obj_tiro; 


////// a arma não fica de ponta cabeça, soltar a arma ,Arma e tiro seguem o mouse, fica na frente, 
#region////// fazer o tiro sair da ponta da arma.


atirando = function()
{
    if (!instance_exists(Obj_jogador)) return; 
    
    if (!na_mao)
    {
        var _distancia_atual = point_distance(x, y, Obj_jogador.x, Obj_jogador.y);
        var _tecla_pegar = keyboard_check_pressed(ord("E"));

        if (_distancia_atual <= 70 && _tecla_pegar)
        {
            na_mao = true;
        }
        return; 
    }

    // acompanha o jogador
    x = Obj_jogador.x;
    y = Obj_jogador.y;
    depth = Obj_jogador.depth - 1; // fica na frente
    
    image_angle = point_direction(x, y, mouse_x, mouse_y);
	
	//Faz a arma seguir o mouse 
	image_angle = point_direction(x, y, mouse_x, mouse_y);


	// se o mouse estiver para a esquerda (entre 90 e 270 graus)
	if (image_angle > 90 && image_angle < 270)
	{
    image_yscale = -1; // inverte a arma para cima
	}
	else
	{
    image_yscale = 1;  // deixa a arma normal
	}
    
    var _mouse_click = mouse_check_button(mb_left);
    var _dt = delta_time / 1000000;

    if (daley_tiro > 0) daley_tiro -= _dt;

    if (atirar && _mouse_click && daley_tiro <= 0)
    {
        daley_tiro = espera_tiro;
        var _distancia_cano = 20;
        var _x = lengthdir_x(_distancia_cano, image_angle);
        var _y = lengthdir_y(_distancia_cano, image_angle);
        
        // criando com DEPTH para evitar o erro de Layer
        var _inst_tiro = instance_create_depth(x + _x, y + _y, depth, objeto_tiro);
        
        if (instance_exists(_inst_tiro))
        {
           _inst_tiro.speed = velocidade_tiro * _dt; 
           _inst_tiro.direction = image_angle;
           _inst_tiro.image_angle = image_angle;
        }
    }
    
    // soltar a arma 
    if (keyboard_check_pressed(ord("E")) && na_mao) {
        na_mao = false;
    }
}
#endregion