if (!peguei) 
{
    // --- LÓGICA NO CHÃO ---
    // Verifica se o jogador está perto e apertou E
    if (distance_to_object(Obj_jogador) < 40 && keyboard_check_pressed(ord("E"))) 
    {
        peguei = true;
    }
} 
else 
{
    // --- LÓGICA NA MÃO ---
    visible = true;
    depth = Obj_jogador.depth - 1; // Fica na frente do jogador
    
    // Seguir a posição do jogador
    x = Obj_jogador.x;
    y = Obj_jogador.y;
    
    // Apontar para o mouse
    image_angle = point_direction(x, y, mouse_x, mouse_y);

    // Se clicar com o botão esquerdo, usa o kit
    if (mouse_check_button_pressed(mb_left)) 
    {
        // Tenta curar 4 de vida
        var _sucesso = scr_jogador_curar(4);
        
        if (_sucesso) 
        {
            instance_destroy(); // O kit some após ser usado
        }
    }
}