import sys

def strip_classes(filepath, classes_to_remove):
    with open(filepath, 'r') as f:
        lines = f.readlines()
    
    new_lines = []
    skip = False
    brace_count = 0
    
    for line in lines:
        if skip:
            brace_count += line.count('{')
            brace_count -= line.count('}')
            if brace_count == 0:
                skip = False
            continue
        
        should_skip = False
        for cls in classes_to_remove:
            if line.startswith(f"class {cls} extends"):
                should_skip = True
                brace_count = line.count('{') - line.count('}')
                if brace_count > 0:
                    skip = True
                break
        
        if not should_skip:
            new_lines.append(line)
            
    with open(filepath, 'w') as f:
        f.writelines(new_lines)

classes = ["_PlaceListTileOld", "_PlaceImage", "_PlaceDetails", "_RatingLabel"]
strip_classes('lib/features/home/presentation/pages/search_screen.dart', classes)
strip_classes('lib/features/service_listing/presentation/pages/service_listing_screen.dart', classes)
