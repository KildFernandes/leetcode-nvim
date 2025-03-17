#ifndef SOLUTION_H
#define SOLUTION_H
//2222
#include <vector>
#include <unordered_map>

class Solution {
public:
    std::vector<int> solution(const std::vector<int>& nums, int target) {
        std::unordered_map<int, int> numMap;
        for (int i = 0; i < nums.size(); ++i) {
            int complement = target - nums[i];
            if (numMap.find(complement) != numMap.end()) {
                return {numMap[complement], i};
            }
            numMap[nums[i]] = i;
        }
        return {};
    }
};

#endif // SOLUTION_H
