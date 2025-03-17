#ifndef SOLUTION_H
#define SOLUTION_H
// 1
#include <vector>

class Solution {
public:
  int binarySearch(const std::vector<int>& nums, int target) {
    int left = 0;
    int right = nums.size() - 1;

    while (left <= right) {
        int mid = left + (right - left) / 2;

        if (nums[mid] == target) {
            return mid;  // Elemento encontrado, retorna o índice
        } else if (nums[mid] < target) {
            left = mid + 1;  // Busca na metade direita
        } else {
            right = mid - 1;  // Busca na metade esquerda
        }
    }

    return -1;  // Elemento não encontrado
}
};

#endif // SOLUTION_H
