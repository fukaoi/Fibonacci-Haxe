import haxe.macro.Expr;
import haxe.macro.Context;

/**
 * Fibonacci algorithm class
 */
class Fibonacci {

  /**
    Recursive pattern
  **/
  public static function runRecur(cnt:Int):Float {
    if (cnt <= 2) return 1;
    return runRecur(cnt - 2) + runRecur(cnt - 1);
  }

  /**
    Procudure pattern
  **/
  public static function runProc(cnt:Int):Float {
    var curr:Float = 1.0, next:Float = 1.0, calc:Float = 0.0;
    for (i in 1...cnt) {
      if (i == 1) {
        calc = curr;
      } else {
        calc = curr + next;
        curr = next;
        next = calc;
      }
    }
    return calc;
  }

  /**
    Haxes maacro pattern
  **/
  @:macro public static function runMacro(cnt:Int, ?expr:Expr) {
    return Context.makeExpr(runProc(cnt), expr.pos);
  }
}
