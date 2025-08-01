import { getPokemon } from '../generics/get-pokemon';
import { Pokemon } from '../interfaces/Pokemon';

getPokemon(1)
    .then(pokemon => {
        console.log(`Pokémon Name: ${pokemon.name}`);
    })
    .catch(error => {
        console.error(error);
    }).finally(() => {
        console.log('Pokémon fetch attempt completed.');
    });