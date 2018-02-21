package main

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
	"github.com/spf13/pflag"
)

func noArgs(cmd *cobra.Command, args []string) error {
	if len(args) == 0 {
		return nil
	}
	return fmt.Errorf(
		"docker: '%s' is not a docker command.\nSee 'docker --help'", args[0])
}

func main() {
	var flags *pflag.FlagSet

	var Version bool
	cmd := &cobra.Command{
		Use:              "docker [OPTIONS] COMMAND [ARG...]",
		Short:            "A self-sufficient runtime for containers",
		SilenceUsage:     true,
		SilenceErrors:    true,
		TraverseChildren: true,
		Args:             noArgs,
		RunE: func(cmd *cobra.Command, args []string) error {
			if Version {
				fmt.Println("show version 1.0.0")
				return nil
			}
			fmt.Println("RunE")
			return nil
		},
		PersistentPreRunE: func(cmd *cobra.Command, args []string) error {
			// flags must be the top-level command flags, not cmd.Flags()
			return nil
		},
	}
	flags = cmd.Flags()
	flags.BoolVarP(&Version, "version", "v", false, "Print version information and quit")

	if err := cmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
