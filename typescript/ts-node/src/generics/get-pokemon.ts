import axios from 'axios';
import { Pokemon } from '../interfaces';

export const getPokemon = async (pokemonId: number): Promise<Pokemon> => {
    const url = `https://pokeapi.co/api/v2/pokemon/${pokemonId}`;
    try {
        const response = await axios.get<Pokemon>(url);
        return response.data;
    } catch (error: any) {
        throw new Error(`Error fetching Pokémon: ${error.response?.statusText || error.message}`);
    }
}
