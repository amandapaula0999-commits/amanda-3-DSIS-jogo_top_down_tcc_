
// Configurações da posição na tela 
var _x_gui = 20;
var _y_gui = 20;
var _largura_max = 200; // tamanho total da barra
var _altura_barra = 20;

// fundo da barra (Preto)
draw_set_color(c_black);
draw_rectangle(_x_gui, _y_gui, _x_gui + _largura_max, _y_gui + _altura_barra, false);

// calcula a porcentagem da vida
var _porcentagem = (hp / hp_max) * _largura_max;

// a vida atual (Vermelha)
draw_set_color(c_red);
draw_rectangle(_x_gui, _y_gui, _x_gui + _porcentagem, _y_gui + _altura_barra, false);

//  contorno (Opcional - Branco)
draw_set_color(c_white);
draw_rectangle(_x_gui, _y_gui, _x_gui + _largura_max, _y_gui + _altura_barra, true);

//  texto da vida
draw_text(_x_gui, _y_gui + 25, "VIDA: " + string(hp) + " / " + string(hp_max));

// reseta a cor para branco para não pintar o resto do jogo de vermelho
draw_set_color(c_white);