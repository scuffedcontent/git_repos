//  Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//  Example => Input: nums = [3,2,4], target = 6 ==> Output: [1,2]
//  For the record if someone is reading this they should know this is not the most effecient

class Solution {
    public int[] twoSum(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            for (int j =i + 1; j < nums.length; j++) {
                int integer = target - nums[i];
                
                if (nums[j] == integer) {
                    return new int[] {i, j};
                }
            }
        }

        throw new IllegalArgumentException("no match found");
    }
}
