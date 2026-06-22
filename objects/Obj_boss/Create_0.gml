// Configurações de movimento
velocidade_boss = 2; // Quantos pixels ele anda por frame
estado_movimento = 0; // 0 = Baixo, 1 = Esquerda, 2 = Cima, 3 = Direita

// Salva a posição inicial de onde o Boss começou o passo atual
posicao_inicial_x = x;
posicao_inicial_y = y;

var tamanho_original_x = sprite_width;
var tamanho_original_y = sprite_height;


image_xscale = 46 / tamanho_original_x;
image_yscale = 50 / tamanho_original_y;

/// da para mudar o tamanho aqui sem deixar estranho 


