draw_self(); // desenhar a sprite do jogador


// Desenha a fala
if (texto_fala != "") 
{
    draw_set_halign(fa_center);
    draw_text_transformed(x, y - 70, texto_fala, 1, 1, 0);
}




// PODE ABAGAR 
draw_set_color(c_black);

/*	pode ser apagado isso é meio que um DBG*/
draw_text(400, 500, "Kits guardados: " + string(Obj_jogador.kits_na_mao));




