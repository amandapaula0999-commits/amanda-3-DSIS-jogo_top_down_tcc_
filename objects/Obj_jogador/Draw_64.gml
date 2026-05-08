// Posição e tamanho da barra
var _x1 = 40;
var _y1 = 40;
var _x2 = 240;
var _y2 = 55;

// Cálculo da porcentagem para a barra
var _porcentagem = (hp / hp_max) * 100;

// Desenha a barra de vida
// Cores: Fundo Preto, Barra Vazia Vermelha, Barra Cheia vermelho claro
draw_healthbar(_x1, _y1, _x2, _y2, _porcentagem, c_black, c_maroon,c_red, 0, true, true);

// Desenha o texto do HP em cima da barra
draw_set_color(c_white);
draw_text(_x1, _y1 - 20, "VIDA: " + string(hp));