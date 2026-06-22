#region MOVIMENTAÇÃO EM LOOP 

// Zera as velocidades no início do frame para recalcular
hspeed = 0;
vspeed = 0;

switch (estado_movimento)
{
    case 0: // ANDANDO PARA BAIXO 
        vspeed = velocidade_boss;
        
        // Se a distância percorrida em Y for maior ou igual a 30 px
        if (y - posicao_inicial_y >= 30)
        {
            y = posicao_inicial_y + 30; // Alinha a posição perfeita
            posicao_inicial_x = x; // Reseta o ponto de partida para o próximo lado
            posicao_inicial_y = y;
            estado_movimento = 1;   
        }
        break;
        
    case 1: // ANDANDO PARA A ESQUERDA
        hspeed = -velocidade_boss;
        
        // Como vai para a esquerda, a posição X atual diminui
        if (posicao_inicial_x - x >= 100)
        {
            x = posicao_inicial_x - 30;
            posicao_inicial_x = x;
            posicao_inicial_y = y;
            estado_movimento = 2;   // Muda para o próximo estado 
        }
        break;
        
    case 2: // ANDANDO PARA CIMA
        vspeed = -velocidade_boss;
        
        // Como sobe, a posição Y atual diminui
        if (posicao_inicial_y - y >= 100)
        {
            y = posicao_inicial_y - 30;
            posicao_inicial_x = x;
            posicao_inicial_y = y;
            estado_movimento = 3;  
        }
        break;
        
    case 3: // ANDANDO PARA A DIREITA 
        hspeed = velocidade_boss;
        
        if (x - posicao_inicial_x >= 100)
        {
            x = posicao_inicial_x + 30;
            posicao_inicial_x = x;
            posicao_inicial_y = y;
            estado_movimento = 0;    // Volta para o início 
        }
        break;
}

#endregion


#region CONTROLE DE SPRITES DO BOSS



switch (estado_movimento)
{
    case 0:
        image_xscale = 1;
        sprite_index = Spr_boss_andando_baixo;
        break;
        
    case 1:
        sprite_index = Spr_boss_andando_dirEsque;
        image_xscale = -1; // Espelha a sprite para a esquerda
        break;
        
    case 2: 
        image_xscale = 1;
        sprite_index = Spr_boss_andando_cima;
        break;
        
    case 3: 
        sprite_index = Spr_boss_andando_dirEsque;
        image_xscale = 1; // Deixa a sprite normal para a direita
        break;
}

#endregion