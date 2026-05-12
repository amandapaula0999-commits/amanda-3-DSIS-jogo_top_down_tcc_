// Seguir o jogador (comum para espada e arma de fogo)
if (instance_exists(Obj_jogador)) {
     // acompanha o jogador
    x = Obj_jogador.x;
    y = Obj_jogador.y;
    depth = Obj_jogador.depth - 1; // fica na frente
     
	//Faz a arma seguir o mouse 
	image_angle = point_direction(x, y, mouse_x, mouse_y);

}

// Step do Obj_pai_arma
if (timer_ataque > 0) {
    timer_ataque--;
}