import os
import re

def extract_snackbars(root_dir):
    pattern = re.compile(r'(showSnackBar|showSuccess|showError)\s*\(')
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.dart'):
                filepath = os.path.join(dirpath, filename)
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                    
                    for match in pattern.finditer(content):
                        start_idx = match.start()
                        
                        paren_count = 0
                        end_idx = start_idx
                        
                        for i in range(match.end() - 1, len(content)):
                            char = content[i]
                            if char == '(':
                                paren_count += 1
                            elif char == ')':
                                paren_count -= 1
                                if paren_count == 0:
                                    end_idx = i
                                    break
                                        
                        snippet = content[start_idx:end_idx+1]
                        print(f"--- {filepath} ---")
                        print(snippet)
                        print()

extract_snackbars('lib')
