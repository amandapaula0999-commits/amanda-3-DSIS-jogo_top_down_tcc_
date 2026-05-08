event_inherited(); // Faz ela seguir o jogador (código do pai)

// Lógica específica da espada (O Arco de Ataque)
if (!atacando) {
    image_angle = point_direction(x, y, mouse_x, mouse_y);
    
    if (mouse_check_button_pressed(mb_right) && timer_ataque <= 0) {
        atacando = true;
        angulo_inicial = image_angle + 60;
        image_angle = angulo_inicial;
    }
}

if (atacando) {
    image_angle -= 15; // Velocidade do giro
    if (image_angle <= angulo_inicial - 120) {
        atacando = false;
        timer_ataque = 20; 
    }
}