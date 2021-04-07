
/*S
class CategorySelection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.signIn),
        actions: [
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person),
              label: Text(AppLocalizations.of(context)!.signUp))
        ],
      ),
      body: BlocProvider(create: (context) => Locator().locator<CategorySelectionBloc>(),
          child: Container()),

    );
  }
}
*/