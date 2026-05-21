//(Pegar, Largar, Seguir Jogador, Intervalo de Tiro)
event_inherited(); 

// Se não estiver na mão, não faz nada
if (!na_mao) return; 


#region /////////ATAQUE 

if (!atacando) 
{
    // Segue o mouse e usa o sprite parado
    
    sprite_index = object_get_sprite(Obj_faca);
	image_angle = point_direction(x, y, mouse_x, mouse_y);

    // ataque
    if (mouse_check_button_pressed(mb_left) && daley_tiro <= 0) 
    {
        if (instance_number(Obj_rit) < 2) // Limite de 2 caixas
        {
            atacando = true;
            sprite_index = Spr_ataque_espada;
            image_index = 0;
            
            // Define o intervalo (delay) usando a variável que já existe no Pai
            daley_tiro = 1.5; 

            // Cria a caixa de dano na frente da faca
			
			var _dist = 30; // Diminuír para ficar mais perto da ponta	
			var _x = x + lengthdir_x(_dist, image_angle) + 5 ; //-esquerda +direita 
			var _y = y + lengthdir_y(_dist, image_angle) - 2; // -sobe e +desse a caixa
            
			var _inst = instance_create_layer(_x, _y, "armas", Obj_rit);
			
			//caixa girar junto com a faca
			_inst.image_angle = image_angle;
        }
    }
}


#endregion//////////////////////


else ///////NÃO ESTA SEMDO LIDA NO MOMENTO ARRUMMAR !!!!!!!!!!!!!
{
   //espera terminar a animação par continuar seguindo o mouse 
   
    if (image_index >= image_number - 1) 
    {
        atacando = false;
        sprite_index = object_get_sprite(Obj_faca);

    }
}