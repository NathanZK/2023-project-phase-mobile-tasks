class Solution:
    def getOrder(self, tasks: List[List[int]]) -> List[int]:
        heap = []
        order = []

        # Insert the index of each task into the task list. This is to prioritize the task numbers after their arrival times.
        for i in range(len(tasks)):
            tasks[i].insert(1, i)

        # Sort tasks based on their arrival times.
        tasks.sort()
        time = tasks[0][0]
        
        i = 0
        while i<len(tasks):
            while i < len(tasks) and time >= tasks[i][0]:
                # Add tasks to the heap based on their processing times and original indices.
                heappush(heap, (tasks[i][2], tasks[i][1]))
                i += 1
            if not heap:
                # If the heap is empty, set the time to the next task's arrival time.
                time = tasks[i][0]
            else:
                # Process the shortest task from the heap.
                shortest = heappop(heap)
                order.append(shortest[1])
                time += shortest[0]

        while heap:
            # Process any remaining tasks in the heap.
            shortestTime, index = heappop(heap)
            order.append(index)

        return order

# Test cases
if __name__ == "__main__":
    solution = Solution()

    tasks1 = [[1,2],[2,4],[3,2],[4,1]]
    print(solution.getOrder(tasks1))  # Output: [0,2,3,1]

    tasks2 = [[7,10],[7,12],[7,5],[7,4],[7,2]]
    print(solution.getOrder(tasks2))  # Output: [4,3,2,0,1]

