tempo_de_vida += 1;

// Se ele existir por mais de 6 frames, ele se destrói
if (tempo_de_vida > 6) 
{ 
    instance_destroy(); 
}

