import json
import sys

def parse_node(node, depth=0):
    indent = "  " * depth
    name = node.get("name", "Unknown")
    node_type = node.get("type", "Unknown")
    out = [f"{indent}- {name} ({node_type})"]
    
    # Layout properties
    layout = []
    if "layoutMode" in node:
        layout.append(f"mode={node['layoutMode']}")
    if "itemSpacing" in node:
        layout.append(f"gap={node['itemSpacing']}")
    if "paddingTop" in node:
        layout.append(f"pt={node['paddingTop']}, pb={node['paddingBottom']}, pl={node['paddingLeft']}, pr={node['paddingRight']}")
    if "cornerRadius" in node:
        layout.append(f"radius={node['cornerRadius']}")
    
    # Typography
    if "style" in node:
        style = node["style"]
        if "fontSize" in style:
            layout.append(f"font={style.get('fontFamily')} {style.get('fontWeight')} {style['fontSize']}px")
    
    if layout:
        out.append(f"{indent}  ↳ " + " | ".join(layout))
    
    for child in node.get("children", []):
        out.extend(parse_node(child, depth + 1))
        
    return out

with open('figma_nodes.json') as f:
    data = json.load(f)

for node_id, node_data in data.get('nodes', {}).items():
    print(f"\nNode ID: {node_id}")
    print("\n".join(parse_node(node_data['document'])))
