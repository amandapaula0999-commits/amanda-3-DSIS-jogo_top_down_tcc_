event_inherited(); // Variáveis do pai
 


dano = 2; // O quando de dano ele vai dar 
espera_tiro = 0.33;       //3 tiros por segundo (1/3=0,33 )
velocidad_tiro = 600;   // Velocidade do tiro
objeto_tiro = Obj_tiro;  // Usa o objeto de bala comum



// Configurações de Munição
max_balas = 15;
balas_atuais = 15;

// Configurações de Tempo (em segundos)
tempo_recarga_alvo = 2.5; 
timer_recarga = 0; // Acumulador
recarregando = false;


recarga_tiro = 0;   // Acumulador para o tiro

caixas_municao = 0; // Quantidade de caixas de prego guardadas nesta arma

