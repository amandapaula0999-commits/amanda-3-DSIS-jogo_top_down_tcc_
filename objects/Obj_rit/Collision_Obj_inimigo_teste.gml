// Aumenta o contador a cada frame
tempo_de_vida += 1;

// Se a caixa existir por mais de 5 frames (quase instantâneo), ela se destrói
if (tempo_de_vida > 5) 
{
    instance_destroy();
};