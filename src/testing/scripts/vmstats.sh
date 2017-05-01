###un comment following lines to generate graphs for full version of college cloud edition

#python get-graphs.py "test-case2-vmstat-run1.txt" "run1 status" "red" "Run1 : only edx + cluster components running"
#python get-graphs.py "test-case2-vmstat-run2.txt" "run2 status" "cyan" "Run2: edx + cluster components + one lab running"
#python get-graphs.py "test-case2-vmstat-run3.txt" "run3 status" "blue" "Run3: edx + cluster components + one lab running"
#python get-graphs.py "test-case2-vmstat-run4.txt" "run4 status" "green" "Run4: edx + cluster components + one lab running"
#python get-graphs.py "test-case2-vmstat-run5.txt" "run5 status" "blue" "Run5: edx + cluster components + one lab running"


###un comment following lines to generate graphs for edx machine(split version of college cloud edition)
python get-graphs.py "split-cc-vmstat-edx-run1.txt"  "run1 status" "red" "Run1 : only edx running "
python get-graphs.py "split-cc-vmstat-edx-run2.txt" "run2 status" "cyan" "Run2: edx running"
python get-graphs.py "split-cc-vmstat-edx-run3.txt" "run3 status" "blue" "Run3: edx running"
python get-graphs.py "split-cc-vmstat-edx-run4.txt" "run4 status" "green" "Run4: edx running"
python get-graphs.py "split-cc-vmstat-edx-run5.txt" "run5 status" "blue" "Run5: edx running"
