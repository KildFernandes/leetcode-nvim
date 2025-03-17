package src.algorithms.list.twosum;

import src.algorithms.list.twosum.TwoSum;

public class Main {

    // Método para testar a função twoSum
    public static void testTwoSum(int[] nums, int target, int[] expected, String testName) {
        System.out.println("Executando teste: " + testName);

        int[] result = TwoSum.twoSum(nums, target);

        if (result.length == 2 && nums[result[0]] + nums[result[1]] == target) {
            System.out.println("✅ Sucesso: Par encontrado nos índices [" + result[0] + ", " + result[1] + "]");
            System.out.println("   Números: [" + nums[result[0]] + ", " + nums[result[1]] + "]");
        } else if (result.length == 0 && expected.length == 0) {
            System.out.println("✅ Sucesso: Nenhum par encontrado, conforme esperado.");
        } else {
            System.out.println("❌ Falha: Resultado inesperado.");
            System.out.println("   Esperado: Índices [" + expected[0] + ", " + expected[1] + "]");
            System.out.println("   Obtido: Índices [" + (result.length > 0 ? result[0] : "N/A") + ", " + (result.length > 0 ? result[1] : "N/A") + "]");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        // Testes
        testTwoSum(new int[]{2, 7, 11, 15}, 9, new int[]{0, 1}, "Caso básico");
        testTwoSum(new int[]{3, 2, 4}, 6, new int[]{1, 2}, "Caso com múltiplos pares possíveis");
        testTwoSum(new int[]{3, 3}, 6, new int[]{0, 1}, "Caso com números repetidos");
        testTwoSum(new int[]{1, 2, 3, 4}, 10, new int[]{}, "Caso sem solução");
        testTwoSum(new int[]{}, 0, new int[]{}, "Caso com array vazio");
    }
}
