tempo_de_vida += 1;// contador 


// Se ele existir por mais de 20 frames some
if (tempo_de_vida > 20) { 
    instance_destroy(); 
}
