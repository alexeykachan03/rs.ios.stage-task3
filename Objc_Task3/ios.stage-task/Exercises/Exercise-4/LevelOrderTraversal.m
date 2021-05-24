#import "LevelOrderTraversal.h"

int position = 0;

@interface Node : NSObject
 
@property NSNumber *num;
@property Node *left;
@property Node *right;
 
- (Node *)initWithValue:(NSNumber *)value;
- (Node *)getTree:(NSArray *) preorder;
- (NSMutableArray *)getLevelTraversal;
 
@end

@implementation Node

- (Node *)initWithValue:(NSNumber *)value {
 
    self = [super init];
    if (self != nil) {
        self.num = value;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

- (Node *)getTree:(NSArray *)preorder {
    if ([preorder count] <= position || preorder[position] == [NSNull null]) {
        return nil;
    }
    Node *root = [[Node alloc] initWithValue: preorder[position]];

    if (([preorder count] - 1) == position) {
        return root;
    }
    
    position++;
    root.left = [[Node alloc] getTree: preorder];
    
    position++;
    root.right = [[Node alloc] getTree: preorder];
    
    return root;
}

- (NSMutableArray *)getLevelTraversal {
    
    NSMutableArray *traversal = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.num, nil], nil];
        
    if (self.left != nil) {
        NSArray *left = self.left.getLevelTraversal;
        for (int i = 0; i < left.count; ++i) {
            if (i < traversal.count - 1) {
                [traversal[i + 1] addObjectsFromArray:left[i]];
            } else {
                [traversal addObject: left[i]];
            }
        }
    }
    
    if (self.right != nil) {
        NSArray *right = self.right.getLevelTraversal;
        for (int i = 0; i < right.count; ++i) {
            if (i < traversal.count - 1) {
                [traversal[i + 1] addObjectsFromArray:right[i]];
            } else {
                [traversal addObject: right[i]];
            }
        }
    }
    return traversal;
}
 
@end


NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    position = 0;
    Node *restoredTree = [[Node alloc] getTree:tree];
        if (restoredTree) {
            return [restoredTree getLevelTraversal];
        } else {
            return @[];
        }
}
