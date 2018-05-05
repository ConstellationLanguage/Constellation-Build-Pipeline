namespace Constellation {
	public class MoreCondition : ICondition {
		Variable var1;
		Variable var2;

		public MoreCondition (Variable _var1, Variable _var2) {
			var1 = _var1;
			var2 = _var2;
		}
		public bool isConditionMet () {
			if (var1.GetFloat () > var2.GetFloat ())
				return true;
			else
				return false;
		}
	}
}