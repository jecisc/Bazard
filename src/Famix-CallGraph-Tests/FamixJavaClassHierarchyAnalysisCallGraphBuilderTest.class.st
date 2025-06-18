"
A FamixJavaClassHierarchyAnalysisCallGraphBuilderTest is a test class for testing the behavior of FamixJavaClassHierarchyAnalysisCallGraphBuilder
"
Class {
	#name : 'FamixJavaClassHierarchyAnalysisCallGraphBuilderTest',
	#superclass : 'TestCase',
	#category : 'Famix-CallGraph-Tests',
	#package : 'Famix-CallGraph-Tests'
}

{ #category : 'helpers' }
FamixJavaClassHierarchyAnalysisCallGraphBuilderTest >> modelExampleWithSimpleClassHierarchy [
	"
	class A { foo(){...} }
	
	class B extends A { foo(){...} }
	
	class C extends B { foo(){...} }
	
	class D extends B { foo(){...} }
	
	class Main { 
	
	static void main(){
		B b1 = new B();
		A a1 = new A();
		f(b1);
		g(b1);
	}
	
	static void f(A a2){
			a2.foo();
		}

	static void g(B b2){
			B b3 = b2;
			b3 = new C();
			b3.foo();
		}
	 }
	
	=============================================
	
	A
	
	"

	| model cA cB cC cD cMain fooA fooB fooC fooD main f g |
	model := FamixJavaModel named: 'Example1'.

	cA := FamixJavaClass named: 'A' model: model.
	cB := FamixJavaClass named: 'B' model: model.
	cC := FamixJavaClass named: 'C' model: model.
	cD := FamixJavaClass named: 'D' model: model.
	cMain := FamixJavaClass named: 'Main' model: model.

	FamixJavaInheritance source: cB target: cA model: model.
	FamixJavaInheritance source: cC target: cB model: model.
	FamixJavaInheritance source: cD target: cB model: model.

	fooA := (FamixJavaMethod named: 'foo' model: model)
		        parentType: cA;
		        signature: 'foo()';
		        yourself.

	fooB := (FamixJavaMethod named: 'foo' model: model)
		        parentType: cB;
		        signature: 'foo()';
		        yourself.

	fooC := (FamixJavaMethod named: 'foo' model: model)
		        parentType: cC;
		        signature: 'foo()';
		        yourself.

	fooD := (FamixJavaMethod named: 'foo' model: model)
		        parentType: cD;
		        signature: 'foo()';
		        yourself.

	main := (FamixJavaMethod named: 'main' model: model)
		        parentType: cD;
		        signature: 'main()';
		        yourself.

	f := (FamixJavaMethod named: 'f' model: model)
		     parentType: cD;
		     signature: 'f(A a2)';
		     yourself.

	g := (FamixJavaMethod named: 'g' model: model)
		     parentType: cD;
		     signature: 'g(B b2)';
		     yourself.

	FamixJavaInvocation source: main target: { f } model: model.
	FamixJavaInvocation source: main target: { g } model: model.
	FamixJavaInvocation source: f target: { fooA } model: model.
	FamixJavaInvocation source: g target: { fooB } model: model.

	^ model
]

{ #category : 'tests' }
FamixJavaClassHierarchyAnalysisCallGraphBuilderTest >> testSimple [

	self modelExampleWithSimpleClassHierarchy.
	self flag: #todo
]
