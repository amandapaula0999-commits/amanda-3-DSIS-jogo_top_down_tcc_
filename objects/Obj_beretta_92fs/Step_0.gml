event_inherited(); // Chama o pai faz (pegar, seguir, mirar)

// Só atira se estiver na mão
if (na_mao && mouse_check_button(mb_left) && daley_tiro <= 0)
{
    daley_tiro = espera_tiro; // Reseta o cronômetro que está no pai
    
    var _dt = delta_time / 1000000;
    
    // Calcula a ponta do cano (20 pixels de distância)
    var _x = lengthdir_x(20, image_angle);
    var _y = lengthdir_y(20, image_angle);
    
    // Cria a bala
    var _inst = instance_create_depth(x + _x, y + _y, depth, Obj_tiro);
    
    if (instance_exists(_inst)) {
        _inst.speed = velocidade_tiro * _dt;
        _inst.direction = image_angle;
        _inst.image_angle = image_angle;
        _inst.dano = self.dano; // Passa o dano da Beretta para a bala
    }
}