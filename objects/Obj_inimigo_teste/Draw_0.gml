draw_self(); // Desenha o sprite do inimigo
scr_desenhar_barra_vida(50, 6, 60); // Desenha a barra 

// Desenha a sombra
desenha_sombra();

// Desenha o inimigo

desenha_sprite();


// Campo de visão
if (estado != scr_inimigo_persegue)
{
    draw_set_alpha(0.2);
    campo_visao(larg_visao, sprite_height); 
    draw_set_alpha(1);
}


