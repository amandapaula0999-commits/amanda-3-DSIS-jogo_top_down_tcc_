// Se qualquer arma (espada ou tiro) encostar em qualquer inimigo
if (other.atacando) {
    scr_inimigo_receber_dano(other.dano);
}
// "other" é o inimigo atingido
with(other) {
    scr_inimigo_receber_dano(other.dano);
}
instance_destroy(); // O tiro some após dar dano