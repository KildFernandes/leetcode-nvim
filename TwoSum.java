package src.algorithms.list.twosum;

import java.util.HashMap;
import java.util.Map;

class TwoSum {
      public static int[] twoSum(int[] nums, int target) {
        // Cria um HashMap para armazenar valores e seus índices
        Map<Integer, Integer> numMap = new HashMap<>();

        // Percorre o array
        for (int i = 0; i < nums.length; i++) {
            int complement = target - nums[i]; // Calcula o complemento necessário

            // Verifica se o complemento já foi visto
            if (numMap.containsKey(complement)) {
                // Retorna os índices dos dois números que somam ao alvo
                return new int[]{numMap.get(complement), i};
            }

            // Armazena o valor atual e seu índice no HashMap
            numMap.put(nums[i], i);
        }

        // Se nenhum par for encontrado, retorna um array vazio
        return new int[]{};
    }

}
