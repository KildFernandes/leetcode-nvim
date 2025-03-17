#include <iostream>
#include <vector>
#include "solution.h"

// Função para testar a função binarySearch
void testBinarySearch(const std::vector<int>& nums, int target, int expected, const std::string& testName) {
    std::cout << "Executando teste: " << testName << std::endl;

    Solution sol;
    int result = sol.binarySearch(nums, target);

    if (result == expected) {
        std::cout << "✅ Sucesso: Elemento encontrado no índice " << result << std::endl;
    } else {
        std::cout << "❌ Falha: Esperado índice " << expected << ", mas obtido " << result << std::endl;
    }
    std::cout << std::endl;
}

// Função principal
int main() {
    // Testes
    testBinarySearch({1, 2, 3, 4, 5, 6, 7, 8, 9}, 5, 4, "Caso básico");
    testBinarySearch({1, 2, 3, 4, 5, 6, 7, 8, 9}, 10, -1, "Elemento não encontrado");
    testBinarySearch({1, 2, 3, 4, 5, 6, 7, 8, 9}, 1, 0, "Primeiro elemento");
    testBinarySearch({1, 2, 3, 4, 5, 6, 7, 8, 9}, 9, 8, "Último elemento");
    testBinarySearch({}, 5, -1, "Array vazio");

    return 0;
}
