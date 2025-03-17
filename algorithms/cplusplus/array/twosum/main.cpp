#include <iostream>
#include <vector>
#include "solution.h"


void testTwoSum(const std::vector<int>& nums, int target, const std::vector<int>& expected, const std::string& testName) {
    std::cout << "Executando teste: " << testName << std::endl;

    Solution SolutionClass;
    std::vector<int> result = SolutionClass.solution(nums, target);

    if (result.size() == 2 && nums[result[0]] + nums[result[1]] == target) {
        std::cout << "✅ Sucesso: Par encontrado nos índices [" << result[0] << ", " << result[1] << "]" << std::endl;
        std::cout << "   Números: [" << nums[result[0]] << ", " << nums[result[1]] << "]" << std::endl;
    } else if (result.empty() && expected.empty()) {
        std::cout << "✅ Sucesso: Nenhum par encontrado, conforme esperado." << std::endl;
    } else {
        std::cout << "❌ Falha: Resultado inesperado." << std::endl;
        std::cout << "   Esperado: Índices [" << expected[0] << ", " << expected[1] << "]" << std::endl;
        std::cout << "   Obtido: Índices [" << (result.size() > 0 ? result[0] : -1) << ", " << (result.size() > 0 ? result[1] : -1) << "]" << std::endl;
    }
    std::cout << std::endl;
}

int main() {
    // Testes
    testTwoSum({2, 7, 11, 15}, 9, {0, 1}, "Caso básico");
    testTwoSum({3, 2, 4}, 6, {1, 2}, "Caso com múltiplos pares possíveis");
    testTwoSum({3, 3}, 6, {0, 1}, "Caso com números repetidos");
    testTwoSum({1, 2, 3, 4}, 10, {}, "Caso sem solução");
    testTwoSum({}, 0, {}, "Caso com array vazio");

    return 0;
}
